echo -e "enter a number to select \n 1: even odd \n 2:prime \n 3: palindrom"
read option

prime(){
        echo enter a number
        read num
        for (( i=2 ; i<num ; i++ ))
        do
                if [ $((num%i)) -eq 0 ];then
                        echo its not  prime number
                        return
                fi
        done
        echo its a  prime number
}
oddeven(){
  echo enter a number
  read num;
  if [ $((num%2)) -eq 0  ]; then
          echo number is even
  else
          echo number is odd
  fi
}
palindrom(){
        echo enter a number
        read n
        rev=""
        og=$n

        while [ $n -gt 0 ]
        do
                rev=${rev}$((n%10))
                n=$((n/10))
        done
        if [ $og -eq $rev ];then
                echo its palndrom
        else
                echo not a palindrom
        fi

}
case $option in
        1)oddeven;;
        2)prime;;
        3)palindrom;;
        *)echo building;;
esac