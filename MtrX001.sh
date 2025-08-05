#!/bin/bash
# أداة MtrX001 - واجهة مبسطة للتحكم في 5 منصات
# للأغراض التعليمية فقط - الاستخدام غير القانوني محظور
# GitHub: github.com/MtrX001/Simple-Social-Booster

echo -e "\e[92m
   ███╗   ███╗████████╗██████╗ ██╗  ██╗000
  ████╗ ████║╚══██╔══╝██╔══██╗╚██╗██╔╝000
  ██╔████╔██║   ██║   ██████╔╝ ╚███╔╝ 000
  ██║╚██╔╝██║   ██║   ██╔══██╗ ██╔██╗ 000
  ██║ ╚═╝ ██║   ██║   ██║  ██║██╔╝ ██╗000
  ╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝000
   >>     التحكم في 5 منصات سوشيال ميديا     <<
   >>   YouTube, TikTok, Instagram, Facebook, Twitter   <<
\e[0m"

# واجهة اختيار المنصة
select_platform() {
  clear
  echo -e "\e[35m"
  echo "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
  echo "█      اختر المنصة المستهدفة      █"
  echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
  echo -e "\e[0m"
  
  echo -e "\e[93m1. YouTube"
  echo "2. TikTok"
  echo "3. Instagram"
  echo "4. Facebook"
  echo "5. Twitter"
  echo "6. العودة"
  echo -e "\e[0m"
  
  read -p "MtrX001 > " platform_choice
}

# واجهة اختيار الإجراء
select_action() {
  clear
  echo -e "\e[35m"
  echo "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
  echo "█      اختر الإجراء المطلوب      █"
  echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
  echo -e "\e[0m"
  
  echo -e "\e[93m1. Follow / متابعة"
  echo "2. Like / إعجاب"
  echo "3. Share / مشاركة"
  echo "4. View / مشاهدة"
  echo "5. Comment / تعليق"
  echo "6. العودة"
  echo -e "\e[0m"
  
  read -p "MtrX001 > " action_choice
}

# تنفيذ الإجراء
execute_action() {
  platform=$1
  action=$2
  amount=$3
  
  # أسماء المنصات
  case $platform in
    1) platform_name="YouTube" ;;
    2) platform_name="TikTok" ;;
    3) platform_name="Instagram" ;;
    4) platform_name="Facebook" ;;
    5) platform_name="Twitter" ;;
  esac
  
  # أسماء الإجراءات
  case $action in
    1) action_name="متابعة" ;;
    2) action_name="إعجاب" ;;
    3) action_name="مشاركة" ;;
    4) action_name="مشاهدة" ;;
    5) action_name="تعليق" ;;
  esac
  
  # تحويل الرقم إلى صيغة مقروءة
  formatted_amount=$(echo $amount | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')
  
  echo -e "\n\e[92م[+] جاري تنفيذ $action_name على $platform_name"
  echo -e "\e[94مالكمية: $formatted_amount\e[0م"
  
  # محاكاة التنفيذ مع شريط تقدم
  echo -ne "\e[93م"
  for i in {1..10}; do
    percentage=$((i*10))
    current_amount=$(echo "$amount / 10 * $i" | bc)
    formatted_current=$(echo $current_amount | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')
    
    # شريط التقدم
    bar=""
    for ((j=0; j<$i; j++)); do bar+="■"; done
    for ((j=$i; j<10; j++)); do bar+="□"; done
    
    echo -ne "  [$bar] ($percentage%) - $formatted_current/$formatted_amount\r"
    sleep 0.1
  done
  echo -e "\n\e[92م[✓] تم تنفيذ $action_name بنجاح!\e[0م"
  sleep 2
}

# الواجهة الرئيسية
while true; do
  select_platform
  if [ $platform_choice -eq 6 ]; then
    echo -e "\e[91م[+] تم الخروج\e[0م"
    exit 0
  fi
  
  select_action
  if [ $action_choice -eq 6 ]; then
    continue
  fi
  
  read -p "أدخل الكمية المطلوبة (مثال: 1000000): " amount
  
  execute_action $platform_choice $action_choice $amount
done
