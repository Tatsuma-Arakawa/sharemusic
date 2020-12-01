require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "新規登録機能" do
    before do
      visit root_path
      click_on "新規登録"
    end

    it "ユーザー情報を正しく入力された場合ユーザー登録が成功すること" do
      fill_in "user[username]", with: "テストユーザー"
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "foobar"
      fill_in "user[password_confirmation]", with: "foobar"
      click_on "新規登録する"
      expect(page).to have_content "アカウント登録が完了しました。"
    end

    it "ユーザー情報が入力されない場合ユーザー登録が失敗すること" do
      fill_in "user[username]", with: " "
      fill_in "user[email]", with: " "
      fill_in "user[password]", with: " "
      fill_in "user[password_confirmation]", with: " "
      click_on "新規登録する"
      expect(page).to have_content "3 件のエラーが発生したため ユーザ は保存されませんでした。"
      expect(page).to have_content "Eメールを入力してください"
      expect(page).to have_content "パスワードを入力してください"
      expect(page).to have_content "Usernameを入力してください"
    end
  end

  describe "ログイン機能機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com") }

    before do
      visit root_path
    end

    it "ゲストユーザーでログインに成功すること" do
      click_on "ゲストユーザーでログイン"
      expect(page).to have_content "ゲストユーザーとしてログインしました"
    end

    it "ユーザー情報が正しく入力された場合ログイン、ログアウトに成功すること" do
      click_on "ログイン"
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      expect(page).to have_content "ログインしました。"
      click_on "ログアウト"
      expect(page).to have_content "ログアウトしました"
    end

    it "ユーザー情報が空欄の場合ログインに失敗すること" do
      click_on "ログイン"
      fill_in "user[email]", with: " "
      fill_in "user[password]", with: " "
      click_on "ログインする"
      expect(page).to have_content "Eメールまたはパスワードが違います。"
    end

    it "間違ったユーザー情報を入力した場合ログインに失敗すること" do
      click_on "ログイン"
      fill_in "user[email]", with: "tester@example.com"
      fill_in "user[password]", with: "foobar"
      click_on "ログインする"
      expect(page).to have_content "Eメールまたはパスワードが違います。"
    end
  end

  describe "ユーザー情報更新機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com", username: "テストユーザー") }

    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
    end

    it "ユーザー情報が正しく更新されること" do
      visit edit_user_registration_path
      fill_in "user[username]", with: "サンプルユーザー"
      fill_in "user[introduce]", with: "こんにちは"
      fill_in "user[current_password]", with: "password"
      click_on "変更する"
      expect(page).to have_content "アカウント情報を変更しました。"
      expect(page).to have_content "サンプルユーザー"
      expect(page).to have_content "こんにちは"
    end

    it "現在のパスワードを入力しないと更新されないこと" do
      visit edit_user_registration_path
      fill_in "user[username]", with: "サンプルユーザー"
      fill_in "user[introduce]", with: "こんにちは"
      fill_in "user[current_password]", with: " "
      click_on "変更する"
      expect(page).to have_content "エラーが発生したため ユーザ は保存されませんでした。"
    end

    it "正常にユーザー削除が動作すること" do
      visit edit_user_registration_path
      click_on "ユーザーを削除する"
      expect do
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
      end
    end
  end

  describe "アカウント認証機能" do
    before do
      visit new_user_registration_path
      fill_in "user[username]", with: "テストユーザー"
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "foobar"
      fill_in "user[password_confirmation]", with: "foobar"
      click_on "新規登録する"
      visit new_user_confirmation_path
    end
  end

  describe "パスワード再設定機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com") }

    before do
      visit new_user_password_path
    end

    it "正しくメールアドレスを入力した場合パスワード再設定メールが送信されること" do
      fill_in "user[email]", with: "test@example.com"
      expect { click_on "メールを送信する" }.to change { ActionMailer::Base.deliveries.size }.by(1)
      expect(page).to have_content "パスワードの再設定について数分以内にメールでご連絡いたします。"
    end

    it "メールアドレスを正しく入力しないとパスワード再設定メールが送信されないこと" do
      fill_in "user[email]", with: " "
      expect { click_on "メールを送信する" }.to change { ActionMailer::Base.deliveries.size }.by(0)
      expect(page).to have_content "エラーが発生したため ユーザ は保存されませんでした。"
    end
  end

  describe "フォロー機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com", username: "testuser") }
    let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com", username: "sampleuser") }

    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
    end

    it "フォローするとフォロー、フォロワーが1増えること" do
      visit user_path(second_user.id)
      click_on "フォロー"
      expect(page).to have_content "フォロー中"
      expect(page).to have_content "1 フォロワー"
      visit user_path(user.id)
      expect(page).to have_content "1 フォロー中"
    end

    it "フォローしているユーザー、フォローされているユーザーが正しく表示されること" do
      visit user_path(second_user.id)
      click_on "フォロー"
      click_on "1 フォロワー"
      expect(page).to have_content "testuser"
      visit user_path(user.id)
      click_on "1 フォロー中"
      expect(page).to have_content "sampleuser"
    end
  end
end
