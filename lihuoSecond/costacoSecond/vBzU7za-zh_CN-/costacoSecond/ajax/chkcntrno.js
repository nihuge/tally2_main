Model.prototype.chkcntrno = function (as_cntrno,ai_choice)
{
 var fi_ki;
 var fi_numsum;
 var fi_nummod;
 var fai_num = new Array(11);
 var fb_errcntrno=false;

 if (as_cntrno==null) return true; //null��������֤
 if (as_cntrno=="") return true; //�ղ�������֤
 
 if (as_cntrno.length == 11)   //��ʱ�׼Ϊ11λ�����һλ��У��λ��������11λ�϶����Ǳ�׼��
 { for(fi_ki=1;fi_ki<=11;fi_ki++)
   fai_num[fi_ki] = 0;
  for(fi_ki=1;fi_ki<=4;fi_ki++)     //��ݹ�ʱ�׼��֤���������ǰ���4��Ӣ����ĸ
  {
   fch_char=as_cntrno.charAt(fi_ki-1).toUpperCase();
   switch(true)
   { case (fch_char=="A"):{fai_num[fi_ki] = 10;break;}
    case (fch_char>="V" && fch_char<="Z"):{fai_num[fi_ki] = fch_char.charCodeAt() - 52;break;}
    case (fch_char>="L" && fch_char<="U"):{fai_num[fi_ki] = fch_char.charCodeAt() - 53;break;}
    default:{fai_num[fi_ki] = fch_char.charCodeAt() - 54;break;}
   }
  }
  for(fi_ki=5;fi_ki<=11;fi_ki++)
  {  fch_char=as_cntrno.charAt(fi_ki-1);
   fai_num[fi_ki] = parseInt(fch_char); //ctype((mid(as_cntrno, fi_ki, 1)), integer)
      }
  fi_numsum = 0
  
  for(fi_ki=1;fi_ki<=10;fi_ki++)
  { 
   fi_sqr = 1;
   for(i=1;i<fi_ki;i++){fi_sqr *=2;}
   fi_numsum += fai_num[fi_ki] * fi_sqr;
  }

  if (as_cntrno.substr(0,4) == "HLCU") fi_numsum = fi_numsum - 2; //hapaq lloyd�Ĺ�����ʱ�׼���2
  fi_nummod = fi_numsum % 11;
  if (fi_nummod == 10) fi_nummod = 0;
  if (fi_nummod == fai_num[11]) fb_errcntrno = true;
  return fb_errcntrno;
 }else{
    return fb_errcntrno;
 }  
} 