#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read menu

  if [ "$menu" == "Add Password" ]; then
        echo "サービス名を入力してください："
        read service
        echo "ユーザー名を入力してください："
        read user_name
        echo "パスワードを入力してください："
        read password
        echo "$service:$user_name:$password" >> password_file.txt
        echo "パスワードの追加は成功しました。"
    elif [ "$menu" == "Get Password" ]; then
        echo "サービス名を入力してください："
        read service_name
        result=$(grep "^$service_name:" password_file.txt)
        if [ -z "$result" ]; then
            echo "そのサービスは登録されていません。"
        else
            echo "サービス名：$(echo $result | cut -d':' -f1)"
            echo "ユーザー名：$(echo $result | cut -d':' -f2)"
            echo "パスワード：$(echo $result | cut -d':' -f3)"
        fi
    elif [ "$menu" == "Exit" ]; then
        echo "Thank you!"
        break
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done

