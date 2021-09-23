require "rails_helper"

describe "ログイン前のテスト" do
  describe "トップ画面のテスト" do
    before do
      visit root_path
    end

    context "表示内容の確認" do
      it "root_pathが"/"であるか" do
        expect(current_path).to eq "/"
      end

      it "Topページにaboutページへのリンクが表示されているか" do
        expect(page).to have_link "", href:about_path
      end

      it "Topページに新規登録ページへのリンクが表示されているか" do
        expect(page).to have_link "",href:new_user_registration_path
      end

      it "Topページにログインページへのリンクが表示されているか" do
        expect(page).to have_link "", href:sign_in_path
      end
    end
  end

  describe "aboutページのテスト" do
    before do
      visit about_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/about"
      end
    end
  end

  describe "新規登録ページのテスト" do
    before do
      visit new_user_registration_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users/sign_up"
      end

      it "ニックネームフォームが表示される" do
        expect(page).to have_field "user[name]"
      end

      it "emailフォームが表示される" do
        expect(page).to have_field "user[email]"
      end

      it "passwordフォームが表示される" do
        expect(page).to have_field "user[password"
      end

      it "password再入力フォームが表示される" do
        expect(page).to have_field "user[password_confirmation]"
      end

      it "新規登録ボタンが表示される" do
        expect(page).to have_button "新規登録"
      end
    end

    context "新規登録成功のテスト" do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 4)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it "正しく新規登録される" do
        expect{click_button "新規登録"}.to change(User.all,:count).by(1)
      end

      it "新規登録後、Topページに遷移しているか" do
        expect(current_path).to eq "/"
      end
    end

  end

end