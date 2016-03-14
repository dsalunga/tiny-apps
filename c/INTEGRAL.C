#include <stdio.h>
#include <graphics.h>
#include <dos.h>
#include <math.h>
#include <ctype.h>
#include <conio.h>

int maxx, maxy;
double degconv = 180/M_PI,radconv = M_PI/180;

void tsound(void);
void fsound(void);
void frame(void);

int main(void){
int gdriver = DETECT, gmode;
char mmnu, try;

initgraph(&gdriver, &gmode, "..\\bgi");
maxx = getmaxx(); maxy = getmaxy();
settextjustify(LEFT_TEXT,TOP_TEXT);
do{
	cleardevice();
		setcolor(3);
		line(scrx(1),scry(1)/2,scrx(9),scry(3));
		line(scrx(9),scry(3),scrx(3),scry(9));
		line(scrx(3),scry(9),scrx(1),scry(1)/2);
		setcolor(15);
	gotoxy(15,10); printf("Choose an option:");
	gotoxy(25,14); printf("1. Solution of Right Triangles...");
	gotoxy(25,16); printf("2. Solution of Oblique Triangles...");
	gotoxy(25,18); printf("3. Convertion for Degress and Radian...");
	gotoxy(25,20); printf("4. Quit");
	mmnu = getch();
	if(mmnu=='1'||mmnu=='2'||mmnu=='3'||mmnu=='4')
		tsound();
	else fsound();

	switch(mmnu){
		case '1':
		do{
			right();
			setcolor(14);
			text(0,15,"Try again?[Y/N]:",6);
			do{
			try=getch();
				}while((toupper(try)!='Y')&&(toupper(try)!='N'));
			setcolor(15);
			}while(toupper(try)=='Y');
			break;
		case '2':
		do{
			oblique();
			setcolor(14);
			text(0,15,"Try again?[Y/N]:",6);
			do{
			try=getch();
				}while((toupper(try)!='Y')&&(toupper(try)!='N'));
			setcolor(15);
			}while(toupper(try)=='Y');
			break;
		case '3':
		do{
			cleardevice();
			convert();
			refresh3("Try again?[Y/N]:");
			do{
			try=getch();
				}while((toupper(try)!='Y')&&(toupper(try)!='N'));
			}while(toupper(try)=='Y');
			break;
		}
	} while(mmnu!='4');
closegraph();
return 0;
}

int right(void){
char val1='',val2='',inputval1[200],inputval2[200],
	sidea[100],sideb[100],sidec[100],angleA[100],angleB[100],area[100];
double a=0,b=0,c=0,A=0,B=0,R=0,input1=0,input2=0,a2,b2;
int result=3,x1,x2,y1,y2;
		refresh("Choose a variable/character:","First Choice:",
				"","","Choose a character and enter the corresponding value.");
			rightchoice('');
		do{
		if(val1!=''){refresh("Choose a character:","First Choice:",
				"","","Please select a valid character.");rightchoice('');}
			val1 = getch();
			}while(val1!='a'&&val1!='b'&&val1!='c'
			&&val1!='A'&&val1!='B'&&val1!='@');
		do{
		if(result==2){
			refresh("Enter value:","First Choice:",
			"","","Value should be greater than zero.");
			rightchoice('');}
		else if(result==1){
			refresh("Enter value:","First Choice:",
			"","","The angle should be less than 90 degrees.");
			rightchoice('');}
		else{
		refresh("Enter value:","First Choice:",
			"","","Enter the corresponding value of your choice.");
			rightchoice('');}
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);gets(inputval1);sscanf(inputval1,"%lf",&input1);
		result=check(val1,input1);
		}while(result!=0);
			tsound();
		switch(val1){
			case 'a':a=input1;break;
			case 'b':b=input1;break;
			case 'c':c=input1;break;
			case 'A':A=input1;break;
			case 'B':B=input1;break;
			case '@':R=input1;break;
			}
		result=3;
/* for the second value. */
		refresh("Choose another:","First Choice:",
			"Second Choice:","","Choose another character and enter the corresponding value.");
		rightchoice(val1);
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
valsec:
		do{
			val2 = getch();
/* validate if the values are valid */
			if((val2==val1)||((val1=='A'||val1=='B'||val1=='@')
				&&(val2=='A'||val2=='B'||val2=='@'))||
				((val1=='@'||val1=='c')&&(val2=='@'||val2=='c'))){
				refresh("Choose another:","First Choice:",
					"Second Choice:","","Duplicate or invalid choice.");
				rightchoice(val1);
				gotoxy(28,4);printf("%c = ",val1);
				gotoxy(32,4);printf("%s",inputval1);
				goto valsec;}
			}while(val2!='a'&&val2!='b'&&val2!='c'
			&&val2!='A'&&val2!='B'&&val2!='@');
		do{
		if(result==2){
			refresh("Enter value:","First Choice:",
			"Second Choice:","","Value should be greater than zero.");
			rightchoice(val1);
			}
		else if(result==1){
			refresh("Enter value:","First Choice:",
			"Second Choice:","","The angle should be less than 90 degrees.");
			rightchoice(val1);}
		else{
		refresh("Enter value:","First Choice:",
			"Second Choice:","","Enter the corresponding value of your choice.");
			rightchoice(val1);}
re:
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
		gotoxy(28,6);printf("%c = ",val2);
		gotoxy(32,6);gets(inputval2);sscanf(inputval2,"%lf",&input2);
		if((((val1=='c')&&(val2=='a'||val2=='b'))||
			((val2=='c')&&(val1=='a'||val1=='b')))&&((input2==input1)||
			(val1=='c'&&(input1<input2))||(val2=='c'&&(input1>input2)))){
				refresh("Enter value:","First Choice:",
				"Second Choice:","","Hypotenuse must not be less than or equal to any other side.");
				rightchoice(val1);
				goto re;}
		result=check(val2,input2);
		}while(result!=0);
			tsound();
		switch(val2){
			case 'a':a=input2;break;
			case 'b':b=input2;break;
			case 'c':c=input2;break;
			case 'A':A=input2;break;
			case 'B':B=input2;break;
			case '@':R=input2;break;
			}
/* solve for the remaining variables */
		if(R!=0){b=(b==0)?((2*R)/a):b;a=(a==0)?((2*R)/b):a;}
		if(A!=0||B!=0){
			A=(A==0)?90-B:A;B=(B==0)?90-A:B;
			if(c!=0){a=c*sin(A*radconv);b=c*cos(A*radconv);}
			else if(a!=0){b=a*tan(B*radconv);c=a/cos(B*radconv);}
			else{a=b*tan(A*radconv);c=b/cos(A*radconv);}}
		else{
			a=(a==0)?sqrt(c*c-b*B):a;
			b=(b==0)?sqrt(c*c-a*a):b;
			c=(c==0)?sqrt(a*a+b*b):c;
			A=(atan(a/b))*degconv;B=90-A;}
			R=(a*b)/2;
		refresh("Enter value:","First Choice:",
			"Second Choice:","","Press any key to continue...");
			rightchoice('x');
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
		gotoxy(28,6);printf("%c = ",val2);
		gotoxy(32,6);printf("%s",inputval2);
		getch();

/* next lines should show the figure. */
		cleardevice();
		frame();
		if(a>b){
			a2=scry(8);
			b2=a2*tan(B*radconv);}
		else{
			b2=scrx(6);
			a2=b2*tan(A*radconv);}
		x1 = scrx(3)+((scrx(7)-b2)/2);x2 = x1+b2;
		y2 = scry(1)+((scry(9)-a2)/2);y1 = y2+a2;
		setcolor(14);
		line(x1,y1,x2,y1);line(x2,y1,x2,y2);line(x2,y2,x1,y1);
		setcolor(15);
		text(scrx(3)+scrx(1)/2,scry(1)+scry(1)/2,"Illustration:",6);
		text(x1-8,y1+2,"A",6);text(x2+2,y1+5,"C",6);text(x2+5,y2-20,"B",6);
		text((x1+x2)/2,y1+2,"b",6);text(x2+10,(y2+y1)/2-10,"a",6);
		text((x1+x2)/2-20,(y2+y1)/2-20,"c",6);
/* show the value of each variables */
			sprintf(sidea,"a = %lg unit",a);
			sprintf(sideb,"b = %lg unit",b);
			sprintf(sidec,"c = %lg unit",c);
		sprintf(angleA,"A = %.2lfø",A);
		sprintf(angleB,"B = %.2lfø",B);
			sprintf(area,"@ = %lg unitý",R);
		drawratio(a,b,c);
		setcolor(14);
		text(0,scry(1)+10,"Result:",6);
		setcolor(15);
			text(5,scry(1)+scry(1)/2+10,"Side:",5);
				text(15,scry(2),sidea,5);
				text(15,scry(2)+scry(1)/2,sideb,5);
				text(15,scry(3),sidec,5);
			text(5,scry(3)+scry(1)/2+10,"Area:",5);
				text(15,scry(4),area,5);
			text(5,scry(4)+scry(1)/2+10,"Angle:",5);
				text(15,scry(5),angleA,5);
				text(15,scry(5)+scry(1)/2,angleB,5);
				text(15,scry(6),"c = 90ø",5);
return 0;
}

int oblique(void){
char val1='',val2='',val3='',inputval1[200],inputval2[200],inputval3[200],ambask;
double a=0,b=0,c=0,A=0,B=0,C=0,input1=0,input2=0,input3=0,
	a2=0,b2=0,c2=0,A2=0,B2=0,C2=0;
int result=4,degpie=0,ambi=0,aside=0;
		refresh2("Choose a variable/character:","First Choice:",
				"","","Choose a character and enter the corresponding value.");
		obliquechoice('','');
		do{
		if(val1!=''){ refresh2("Choose a variable/character:","First Choice:",
				"","","Please select a valid choice.");obliquechoice('','');}
			val1 = getch();
			}while(val1!='a'&&val1!='b'&&val1!='c'
			&&val1!='A'&&val1!='B'&&val1!='C');
		do{
		if(result==3){
			refresh2("Enter value:","First Choice:",
			"","","An oblique triangle does not have a right angle.");obliquechoice('','');}
		else if(result==2){
			refresh2("Enter value:","First Choice:",
			"","","Value should be greater than zero.");obliquechoice('','');}
		else if(result==1){
			refresh2("Enter value:","First Choice:",
			"","","The angle should be less than 180 degrees.");obliquechoice('','');}
		else{
		refresh2("Enter value:","First Choice:",
			"","","Enter the corresponding value of your choice.");obliquechoice('','');}
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);gets(inputval1);sscanf(inputval1,"%lf",&input1);
		result=check2(val1,input1);
		}while(result!=0);
			tsound();
		switch(val1){
			case 'a':a=input1;break;
			case 'b':b=input1;break;
			case 'c':c=input1;break;
			case 'A':A=input1;break;
			case 'B':B=input1;break;
			case 'C':C=input1;break;
			}
		result=4;
/* for the second value. */
		refresh2("Choose another:","First Choice:",
			"Second Choice:","","Choose another character and enter the corresponding value.");
		obliquechoice(val1,'');
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
valsec:
		do{
			val2 = getch();
/* validate if the values are valid */
			if(val1==val2){
				refresh2("Choose another:","First Choice:",
					"Second Choice:","","Duplicate input, choose another.");
				obliquechoice(val1,'');
				gotoxy(28,4);printf("%c = ",val1);
				gotoxy(32,4);printf("%s",inputval1);
				goto valsec;}
			}while(val2!='a'&&val2!='b'&&val2!='c'
			&&val2!='A'&&val2!='B'&&val2!='C');
		do{
		if(result==3){
			refresh2("Enter value:","First Choice:","Second Choice:","",
			"An oblique triangle does not have a right angle.");obliquechoice(val1,'');}
		else if(result==2){
			refresh2("Enter value:","First Choice:","Second Choice:","",
			"Value should be greater than zero.");obliquechoice(val1,'');}
		else if(result==-1){
			refresh2("Enter value:","First Choice:","Second Choice:","",
			"This will result to a right triangle, change the value.");obliquechoice(val1,'');}
		else if(result==1){
			refresh2("Enter value:","First Choice:","Second Choice:","",
			"The angle should be less than 180 degrees.");obliquechoice(val1,'');}
		else if(degpie==1){
			refresh2("Enter value:","First Choice:","Second Choice:","",
			"Sum of the first and second angles must be less than 180 degress.");obliquechoice(val1,'');}
		else{
		refresh2("Enter value:","First Choice:","Second Choice:","",
		"Enter the corresponding value of your choice.");obliquechoice(val1,'');}
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
		gotoxy(28,6);printf("%c = ",val2);
		gotoxy(32,6);gets(inputval2);sscanf(inputval2,"%lf",&input2);
		result=check2(val2,input2);
			if((val1=='A'||val1=='B'||val1=='C')&&
			(val2=='A'||val2=='B'||val2=='C')&&result==0){
				if(input1+input2>=180)
					degpie=1;
				else degpie=0;}
			if((val1=='A'||val1=='B'||val1=='C')&&(val2=='A'||val2=='B'||
				val2=='C')&&(result==0)&&(input1+input2==90))
					result=-1;
		}while(result!=0||degpie==1);
			tsound();
		switch(val2){
			case 'a':a=input2;break;
			case 'b':b=input2;break;
			case 'c':c=input2;break;
			case 'A':A=input2;break;
			case 'B':B=input2;break;
			case 'C':C=input2;break;
			}
		result=4;

/* final variable */
		refresh2("Enter value:","First Choice:",
			"Second Choice:","Third Choice:","Enter the last variable required.");
		obliquechoice(val1,val2);
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
		gotoxy(28,6);printf("%c = ",val2);
		gotoxy(32,6);printf("%s",inputval2);
val3rd:
	do{
		val3=getch();
			if((val3==val2||val3==val1||val2==val1)||((val1=='A'||val1=='B'||val1=='C')&&
			(val2=='A'||val2=='B'||val2=='C')&&(val3=='A'||val3=='B'||val3=='C'))){
				refresh2("Another character:","First Choice:","Second Choice:",
				"Third Choice:","Duplicate or invalid choice, select another.");
				obliquechoice(val1,val2);
				gotoxy(28,4);printf("%c = ",val1);
				gotoxy(32,4);printf("%s",inputval1);
				gotoxy(28,6);printf("%c = ",val2);
				gotoxy(32,6);printf("%s",inputval2);
				goto val3rd;}
			else if(checkvaroblique(val1,val2,val3)!=0){
				refresh2("Another character:","First Choice:","Second Choice:",
				"Third Choice:","AMBIGUOUS case, may result to one, two or no triangle. Continue?[Y/N]");
				obliquechoice(val1,val2);
				gotoxy(28,4);printf("%c = ",val1);
				gotoxy(32,4);printf("%s",inputval1);
				gotoxy(28,6);printf("%c = ",val2);
				gotoxy(32,6);printf("%s",inputval2);
				do{
					ambask=getch();
					}while(toupper(ambask)!='Y'&&toupper(ambask)!='N');
					if(toupper(ambask)=='N'){
						refresh2("Another character:","First Choice:","Second Choice:",
						"Third Choice:","Choose another variable.");obliquechoice(val1,val2);
						gotoxy(28,4);printf("%c = ",val1);
						gotoxy(32,4);printf("%s",inputval1);
						gotoxy(28,6);printf("%c = ",val2);
						gotoxy(32,6);printf("%s",inputval2);
						goto val3rd;}
				}
		}while(val3!='a'&&val3!='b'&&val3!='c'&&val3!='A'&&val3!='B'&&val3!='C');
/* last value of the last variable! */
	do{
		if(result==3){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"An oblique triangle does not have a right angle.");obliquechoice(val1,val2);}
		else if(result==2){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"Value should be greater than zero.");obliquechoice(val1,val2);}
		else if(result==1){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"The angle should be less than 180 degrees.");obliquechoice(val1,val2);}
		else if(degpie==1){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"Sum of the previous and current angles must be less than 180 degress.");
			obliquechoice(val1,val2);}
		else if(aside==1){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"Sum of two sides must be greater than the other side.");obliquechoice(val1,val2);}
		else if(ambi==2){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"AMBIGUOUS case, this may result to two triangles. Continue?[Y/N]:");
			obliquechoice(val1,val2);
			gotoxy(28,4);printf("%c = ",val1);
			gotoxy(32,4);printf("%s",inputval1);
			gotoxy(28,6);printf("%c = ",val2);
			gotoxy(32,6);printf("%s",inputval2);
			gotoxy(28,8);printf("%c = ",val3);
			gotoxy(32,8);printf("%s",inputval3);
			do{
				ambask=getch();
				}while(toupper(ambask)!='Y'&&toupper(ambask)!='N');
				if(toupper(ambask)=='N'){
					refresh2("Another character:","First Choice:","Second Choice:",
					"Third Choice:","Enter another value for the last variable.");
					obliquechoice(val1,val2);}
				else break;
			}
		else if(ambi==3){
			refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"AMBIGUOUS case, no triangle formed. Please change the value.");obliquechoice(val1,val2);}
		else{
		refresh2("Enter value:","First Choice:","Second Choice:","Third Choice:",
			"Enter the corresponding value of your choice.");obliquechoice(val1,val2);}
		gotoxy(28,4);printf("%c = ",val1);
		gotoxy(32,4);printf("%s",inputval1);
		gotoxy(28,6);printf("%c = ",val2);
		gotoxy(32,6);printf("%s",inputval2);
		gotoxy(28,8);printf("%c = ",val3);
		gotoxy(32,8);gets(inputval3);sscanf(inputval3,"%lf",&input3);
		result=check2(val3,input3);
			if(((val1=='A'||val1=='B'||val1=='C')&&
			(val3=='A'||val3=='B'||val3=='C'))&&result==0){
				if(input1+input3>=180)
					degpie=1;
				else degpie=0;}
			else if(((val2=='A'||val2=='B'||val2=='C')&&
			(val3=='A'||val3=='B'||val3=='C'))&&result==0){
				if(input2+input3>=180)
					degpie=1;
				else degpie=0;}
			else if((val1!='A'&&val1!='B'&&val1!='C')&&(val2!='A'&&val2!='B'&&val2!='C')&&
			(val3!='A'&&val3!='B'&&val3!='C')&&result==0){
				if((input1+input2<=input3)||(input2+input3<=input1)||
					(input1+input3<=input2))
					aside=1;
				else aside=0;}
			else if(checkvaroblique(val1,val2,val3)!=0&&result==0){
				switch(val3){
					case 'a':a=input3;break;
					case 'b':b=input3;break;
					case 'c':c=input3;break;
					case 'A':A=input3;break;
					case 'B':B=input3;break;
					case 'C':C=input3;break;
					}
				ambi=checkvaloblique(checkvaroblique(val1,val2,val3),a,b,c,A,B,C);
				}

		}while(result!=0||degpie==1||(ambi==3||ambi==2)||aside==1);
			tsound();
		switch(val3){
			case 'a':a=input3;break;
			case 'b':b=input3;break;
			case 'c':c=input3;break;
			case 'A':A=input3;break;
			case 'B':B=input3;break;
			case 'C':C=input3;break;
			}
	if(ambi!=0){
		switch(ambi){
			case 1:
				if(A!=0){
					if(b!=0){
						B=asin((b*sin(A*radconv))/a)*degconv;
						C=180-(A+B);
						c=(b*sin(C*radconv))/(sin(B*radconv));
						}
					else{
						C=asin((c*sin(A*radconv))/a)*degconv;
						B=180-(A+C);
						b=(a*sin(B*radconv))/(sin(A*radconv));
						}}
				else if(B!=0){
					if(a!=0){
						A=asin((a*sin(B*radconv))/b)*degconv;
						C=180-(A+B);
						c=(b*sin(C*radconv))/(sin(B*radconv));
						}
					else{
						C=asin((c*sin(B*radconv))/b)*degconv;
						A=180-(B+C);
						a=(b*sin(A*radconv))/(sin(B*radconv));
						}}
				else{
					if(a!=0){
						A=asin((a*sin(C*radconv))/c)*degconv;
						B=180-(A+C);
						b=(a*sin(B*radconv))/(sin(A*radconv));
						}
					else{
						B=asin((b*sin(C*radconv))/c)*degconv;
						A=180-(B+C);
						a=(b*sin(A*radconv))/(sin(B*radconv));
						}}
				break;
			case 2:
				if(A!=0){
					if(b!=0){
						B=asin((b*sin(A*radconv))/a)*degconv;
						C=180-(A+B);
						c=(b*sin(C*radconv))/(sin(B*radconv));
						A2=A; a2=a; b2=b;
						B2=180-B;
						C2=180-(A2+B2);
						c2=(b2*sin(C2*radconv))/(sin(B2*radconv));
						}
					else{
						C=asin((c*sin(A*radconv))/a)*degconv;
						B=180-(A+C);
						b=(a*sin(B*radconv))/(sin(A*radconv));
						A2=A; a2=a; c2=c;
						C2=180-C;
						B2=180-(A2-C2);
						b2=(a2*sin(B2*radconv))/(sin(A2*radconv));
						}}
				else if(B!=0){
					if(a!=0){
						A=asin((a*sin(B*radconv))/b)*degconv;
						C=180-(A+B);
						c=(b*sin(C*radconv))/(sin(B*radconv));
						B2=B; a2=a; b2=b;
						A2=180-A;
						C2=180-(A2+B2);
						c2=(b2*sin(C2*radconv))/(sin(B2*radconv));
						}
					else{
						C=asin((c*sin(B*radconv))/b)*degconv;
						A=180-(B+C);
						a=(b*sin(A*radconv))/(sin(B*radconv));
						B2=B; c2=c; b2=b;
						C2=180-C;
						A2=180-(B2+C2);
						a2=(b2*sin(A2*radconv))/(sin(B2*radconv));
						}}
				else{
					if(a!=0){
						A=asin((a*sin(C*radconv))/c)*degconv;
						B=180-(A+C);
						b=(a*sin(B*radconv))/(sin(A*radconv));
						C2=C; a2=a; c2=c;
						A2=180-A;
						B2=180-(A2+C2);
						b2=(a2*sin(B2*radconv))/(sin(A2*radconv));
						}
					else{
						B=asin((b*sin(C*radconv))/c)*degconv;
						A=180-(B+C);
						a=(b*sin(A*radconv))/(sin(B*radconv));
						C2=C; b2=b; c2=c;
						B2=180-B;
						A2=180-(B2+C2);
						a2=(b2*sin(A2*radconv))/(sin(B2*radconv));
						}}
				drawoblique(a,b,c,A,B,C);
				setcolor(14);
				text(0,15,"First Triangle. Press any key to proceed to the next triangle.",6);
				getch();
				setcolor(15);
				drawoblique(a2,b2,c2,A2,B2,C2);
				return 0;
			}
		}

	else if(a!=0&&b!=0&&c!=0){
		A=acos((b*b+c*c-a*a)/(2*b*c))*degconv;
		B=acos((a*a+c*c-b*b)/(2*a*c))*degconv;
		C=180-(A+B);
		}

	else if((A!=0&&b!=0&&c!=0)||(B!=0&&a!=0&&c!=0)||(C!=0&&b!=0&&a!=0)){
		if(A!=0)
			a=sqrt(b*b+c*c-2*b*c*cos(A*radconv));
		else if(B!=0)
			b=sqrt(a*a+c*c-2*a*c*cos(B*radconv));
		else
			c=sqrt(a*a+b*b-2*a*b*cos(C*radconv));

		if(a==0) a=sqrt(b*b+c*c-2*b*c*cos(A*radconv));
		else if(b==0) b=sqrt(a*a+c*c-2*a*c*cos(B*radconv));
		else if(c==0) c=sqrt(a*a+b*b-2*a*b*cos(C*radconv));

		if(A!=0){
			B=acos((a*a+c*c-b*b)/(2*a*c))*degconv;
			C=180-(A+B);
			}
		else if(B!=0){
			C=acos((a*a+b*b-c*c)/(2*a*b))*degconv;
			A=180-(B+C);
			}
		else{
			A=acos((b*b+c*c-a*a)/(2*b*c))*degconv;
			B=180-(A+C);
			}
		}

	else if((A!=0&&B!=0)||(A!=0&&C!=0)||(B!=0&&C!=0)){
// "Two angles and one side!"
		if(A==0) A=180-(B+C);
			else if(B==0) B=180-(A+C);
			else C=180-(A+B);

		if(a!=0){
			b=(a*sin(B*radconv))/(sin(A*radconv));
			c=(b*sin(C*radconv))/(sin(B*radconv));
			}
		else if(b!=0){
			a=(b*sin(A*radconv))/(sin(B*radconv));
			c=(b*sin(C*radconv))/(sin(B*radconv));
			}
		else{
			b=(c*sin(B*radconv))/(sin(C*radconv));
			a=(b*sin(A*radconv))/(sin(B*radconv));
			}
	}
drawoblique(a,b,c,A,B,C);
return 0;
}

int convert(void){
char input[200],rd, rprint[100],dprint[100];
double realinput=0,deg=0,rad=0;
refresh3("Input angle in Degrees/Radian?[D/R]:");
do{
	rd=getch();
	}while(toupper(rd)!='R'&&toupper(rd)!='D');
			tsound();
switch(toupper(rd)){
	case 'R':
		do{
		cleardevice();
		refresh3("Enter angle in Radian:");
		gotoxy(23,2);gets(input);
		sscanf(input,"%lf",&realinput);
		}while(realinput==0);
		deg=realinput*degconv;
		rad=realinput;
		break;
	case 'D':
		do{
		cleardevice();
		refresh3("Enter angle in Degrees:");
		gotoxy(24,2);gets(input);
		sscanf(input,"%lf",&realinput);
		}while(realinput==0);
		rad=realinput*radconv;
		deg=realinput;
		break;
		}
	cleardevice();
		tsound();
	sprintf(dprint,"Degrees: %lg",deg);
	sprintf(rprint,"Radian: %lg",rad);
	text(scrx(1)/2,scry(2),dprint,6);
	text(scrx(1)/2,scry(3),rprint,6);
return 0;
}

int refresh3(char msg[150]){
line(0,scry(1)-10,maxx,scry(1)-10);
text(5,15,msg,5);
return 0;
}

int scry(int numten){
	return(maxy/10*numten);
}

int scrx(int numten){
	return(maxx/10*numten);
}

int text(int x, int y, char msg[150], int size){
	settextstyle(SMALL_FONT,HORIZ_DIR,size);
	outtextxy(x,y,msg);
return 0;
}

int check(char ch, double returnval){
	if(returnval<=0)
		return(2);
	else if((ch=='A'||ch=='B')&&(returnval>=90))
		return(1);
	else return 0;
}

int check2(char ch, double returnval){
	if(returnval<=0)
		return(2);
	else if((ch=='A'||ch=='B'||ch=='C')&&(returnval>=180))
		return(1);
	else if((ch=='A'||ch=='B'||ch=='C')&&returnval==90)
		return(3);
	else return 0;
}

int refresh(char menu[50], char submen1[50], char submen2[50],
	char submen3[50],char status[150]){
int x1,y1,x2,y2,a2,b2;
a2=scry(4)+scry(1)/2;b2=scrx(6);
	cleardevice();
	line(0,scry(3),maxx,scry(3));
	line(scrx(3),scry(3)+scry(1)/2,scrx(3),maxy);
	line(0,scry(3)+scry(1)/2,maxx,scry(3)+scry(1)/2);
	line(0,scry(6),scrx(3),scry(6));
	text(5,5,menu,5);
	text(40,15*3-4,submen1,7);
	text(40,15*5-2,submen2,7);
	text(40,15*7,submen3,7);
	text(0,scry(2)+scry(1)/2+27,status,5);
	setcolor(14);
	text(0,scry(6)+scry(1)/4+5,"Possible Cases:",6);
	setcolor(15);
	text(10,scry(7)+13,"1. An angle & one side",5);
	text(10,scry(7)+scry(1)/2+13,"2. Two sides",5);
	text(10,scry(8)+13,"3. Area & side a or b",5);

	x1 = (scrx(3)+scrx(1)/2)+(((scrx(6)+scrx(1)/2)-b2)/2);x2 = x1+b2;
	y2 = scry(4)+((scry(6)-a2)/2);y1 = y2+a2;
	setcolor(14);
	text(scrx(3)+scrx(1)/2,scry(4),"Sample Figure: Right Triangle",6);
	line(x1,y1,x2,y1);line(x2,y1,x2,y2);line(x2,y2,x1,y1);
	setcolor(15);
	text(x1-8,y1+2,"A",6);text(x2+2,y1+5,"C",6);text(x2+5,y2-20,"B",6);
	text((x1+x2)/2,y1+2,"b",6);text(x2+10,(y2+y1)/2+2,"a",6);
	text((x1+x2)/2-20,(y2+y1)/2-20,"c",6);
	text(scrx(7)+20,scry(7)+scry(1)/2,"@ or Area",6);
return 0;
}

int refresh2(char menu[50], char submen1[50], char submen2[50],
	char submen3[50],char status[150]){
int x1,y1,x2,y2,a2,b2;
a2=scry(4)+scry(1)/2;b2=scrx(6);
	cleardevice();
	line(0,scry(3),maxx,scry(3));
	line(scrx(3),scry(3)+scry(1)/2,scrx(3),maxy);
	line(0,scry(3)+scry(1)/2,maxx,scry(3)+scry(1)/2);
	line(0,scry(6),scrx(3),scry(6));
	text(5,5,menu,5);
	text(40,15*3-4,submen1,7);
	text(40,15*5-2,submen2,7);
	text(40,15*7,submen3,7);
	text(0,scry(2)+scry(1)/2+27,status,5);
	setcolor(14);
	text(0,scry(6),"Possible Cases:",6);
	setcolor(15);
	text(10,scry(6)+scry(1)/2+10,"1. Two angles & a side",5);
	text(10,scry(7)+10,"2. Two sides & the",5);
	text(10+20,scry(7)+scry(1)/2+10,"angle in between",5);
	text(10,scry(8)+10,"3. Three sides",5);
	text(10,scry(8)+scry(1)/2+10,"4. Two sides & one ",5);
	text(10+20,scry(9)+10,"opposite angle",5);
	text(10+20,scry(9)+scry(1)/2+10,"(AMBIGUOUS case)",5);

	x1 = (scrx(3)+scrx(1)/2)+(((scrx(6)+scrx(1)/2)-b2)/2);x2 = x1+b2;
	y2 = scry(4)+((scry(6)-a2)/2);y1 = y2+a2;
	setcolor(14);
	text(scrx(3)+25,scry(3)+scry(1)/2+15,"Sample Figure: Oblique Triangle",6);
	line(x1,y1,x2,y1);line(x2,y1,x2-scrx(2),y2);line(x2-scrx(2),y2,x1,y1);
	setcolor(15);
	text(x1-8,y1+2,"A",6);text(x2+2,y1+5,"B",6);text(x2-scrx(2),y2-20,"C",6);
	text((x1+x2)/2,y1+2,"c",6);text(x2-scrx(1)/2-20,(y2+y1)/2-15,"a",6);
	text(scrx(5)+scrx(1)/2,(y2+y1)/2-20,"b",6);
	text(scrx(7)-15,scry(7)+scry(1)/2,"@ = Area",6);
return 0;
}

void frame(void){
line(scrx(3),scry(1),scrx(3),maxy);
line(0,scry(1),maxx,scry(1));
line(0,scry(7)+scry(1)/2,scrx(3),scry(7)+scry(1)/2);
}

int rightchoice(char first){
char *side="[x][x]",finside[50];
setcolor(14);
text(0,scry(3)+scry(1)/2+5,"Valid Choices:",6);
setcolor(15);
switch(first){
	case '@':
		text(20,scry(4)+10,"Side: [a][b]",5);
		break;
	case 'A': case 'B':
		text(20,scry(4)+10,"Side: [a][b][c]",5);
		break;
	case 'c': case 'b': case 'a':
		if(first=='a') side="[b][c]";
		else if(first=='b') side="[a][c]";
		else if(first=='c') side="[a][b]";
		sprintf(finside,"Side: %s",side);
		text(20,scry(4)+10,finside,5);
		text(20,scry(4)+scry(1)/2+10,"Angle: [A][B]",5);
		if(first=='a'||first=='b')
			text(20,scry(5)+10,"Area: [@]",5);
		break;
	case '':
		text(20,scry(4)+10,"Side: [a][b][c]",5);
		text(20,scry(4)+scry(1)/2+10,"Angle: [A][B]",5);
		text(20,scry(5)+10,"Area: [@]",5);
		break;
	default:
		text(20,scry(4)+10,"Selection complete.",5);
		}
	return 0;
}

int drawoblique(double a, double b, double c, double A, double B, double C){
double a2,b2,c2,R,h,ha,hb,adja,adjb,opp,hc;
int y1,y2,x1,x2,x3;
char sidea[100],sideb[100],sidec[100],angleA[100],angleB[100],angleC[100],area[100];
	h=a*sin((180-B)*radconv);
	R=(c*h)/2;
	cleardevice();
	frame();
			sprintf(sidea,"a = %lg unit",a);
			sprintf(sideb,"b = %lg unit",b);
			sprintf(sidec,"c = %lg unit",c);
		sprintf(angleA,"A = %.2lfø",A);
		sprintf(angleB,"B = %.2lfø",B);
		sprintf(angleC,"C = %.2lfø",C);
			sprintf(area,"@ = %lg unitý",R);
		setcolor(14);
		text(0,scry(1)+10,"Result:",6);
		setcolor(15);
			text(5,scry(1)+scry(1)/2+10,"Side:",5);
				text(15,scry(2),sidea,5);
				text(15,scry(2)+scry(1)/2,sideb,5);
				text(15,scry(3),sidec,5);
			text(5,scry(3)+scry(1)/2+10,"Area:",5);
				text(15,scry(4),area,5);
			text(5,scry(4)+scry(1)/2+10,"Angle:",5);
				text(15,scry(5),angleA,5);
				text(15,scry(5)+scry(1)/2,angleB,5);
				text(15,scry(6),angleC,5);

		if(C>90||(A<90&&B<90&&C<90)){
			if(c>h){
				c2=scrx(6);
				b2=(c2*sin(B*radconv))/(sin(C*radconv));
				a2=(b2*sin(A*radconv))/(sin(B*radconv));
				}
			else{
				a2=scry(8)/(sin((180-B)*radconv));
				b2=(a2*sin(B*radconv))/(sin(A*radconv));
				c2=(b2*sin(C*radconv))/(sin(B*radconv));
				}
				hc=a2*sin((180-B)*radconv);
				opp=a2*sin((90-B)*radconv);
				}
		else if(A>90){
			ha=b*sin((180-A)*radconv);
			adja=b*cos((180-A)*radconv);
			if((c+adja)>ha){
				a2=scrx(6)/cos(B*radconv);
				ha=a2*sin(B*radconv);
				b2=ha/sin((180-A)*radconv);
				c2=(b2*sin(C*radconv))/(sin(B*radconv));
				adja=b2*cos((180-A)*radconv);
				}
			else{
				ha=scry(8);
				a2=ha/sin(B*radconv);
				b2=ha/sin((180-A)*radconv);
				c2=(b2*sin(C*radconv))/(sin(B*radconv));
				adja=b2*cos((180-A)*radconv);
				}}
		else{
			hb=a*sin((180-B)*radconv);
			adjb=a*cos((180-B)*radconv);
			if((c+adjb)>hb){
				b2=scrx(6)/cos(A*radconv);
				hb=b2*sin(A*radconv);
				a2=hb/sin((180-B)*radconv);
				c2=(b2*sin(C*radconv))/(sin(B*radconv));
				adjb=a2*cos((180-B)*radconv);
				}
			else{
				hb=scry(8);
				b2=hb/sin(A*radconv);
				a2=hb/sin((180-B)*radconv);
				c2=(b2*sin(C*radconv))/(sin(B*radconv));
				adjb=a2*cos((180-B)*radconv);
				}}
		if(A>90){
			x1=scrx(3)+((scrx(7)-(c2+adja))/2)+adja;
			x2=x1+c2;
			x3=scrx(3)+((scrx(7)-(c2+adja))/2);
			y1=scry(1)+((scry(9)-ha)/2);
			y2=y1+ha;
			}
		else if(B>90){
			x1=scrx(3)+((scrx(7)-(c2+adjb))/2);
			x2=x1+c2;
			x3=x2+adjb;
			y1=scry(1)+((scry(9)-hb)/2);
			y2=y1+hb;
			}
		else{
			x1=scrx(3)+((scrx(7)-c2)/2);
			x2=x1+c2;
			x3=x2-opp;
			y1=scry(1)+((scry(9)-hc)/2);
			y2=y1+hc;
			}
		drawratio(a,b,c);
		setcolor(14);
		line(x1,y2,x2,y2);
		line(x2,y2,x3,y1);
		line(x3,y1,x1,y2);
		setcolor(15);
		text(x1-8,y2+2,"A",6);text(x3,y1-25,"C",6);text(x2+5,y2,"B",6);
		if(A>90)
			text((x3+x1)/2-5,(y1+y2)/2+5,"b",6);
		else if(B>90)
			text((x3+x1)/2-15,(y1+y2)/2-15,"b",6);
		else
			text((x3+x1)/2-15,(y1+y2)/2-15,"b",6);
		if(A>90)
			text((x2+x3)/2+5,(y1+y2)/2-20,"a",6);
		else if(B>90)
			text((x2+x3)/2-5,(y1+y2)/2+10,"a",6);
		else
			text((x2+x3)/2+15,(y1+y2)/2-15,"a",6);
		text((x1+x2)/2,y2,"c",6);
return 0;
}

int checkvaroblique(char inp1, char inp2, char inp3){
	int a=0,b=0,c=0,A=0,B=0,C=0,returnval=0;
	switch(inp1){
		case 'a':a=1;break;
		case 'b':b=1;break;
		case 'c':c=1;break;
		case 'A':A=1;break;
		case 'B':B=1;break;
		case 'C':C=1;break;
		}
	switch(inp2){
		case 'a':a=1;break;
		case 'b':b=1;break;
		case 'c':c=1;break;
		case 'A':A=1;break;
		case 'B':B=1;break;
		case 'C':C=1;break;
		}
	switch(inp3){
		case 'a':a=1;break;
		case 'b':b=1;break;
		case 'c':c=1;break;
		case 'A':A=1;break;
		case 'B':B=1;break;
		case 'C':C=1;break;
		}
if((A!=0&&a!=0)&&(b!=0||c!=0))
	returnval=(b!=0)?11:12;
else if((B!=0&&b!=0)&&(c!=0||a!=0))
	returnval=(a!=0)?21:22;
else if((C!=0&&c!=0)&&(b!=0||a!=0))
	returnval=(a!=0)?31:32;
else returnval=0;
return(returnval);
}

int checkvaloblique(int casetype,double a,double b,double c,double A,double B,double C){
double A2, b2, a2,h;
int ret=0;
	switch(casetype){
		case 11:
			A2=A;b2=b;a2=a;break;
		case 12:
			A2=A;b2=c;a2=a;break;
		case 21:
			A2=B;b2=a;a2=b;break;
		case 22:
			A2=B;b2=c;a2=b;break;
		case 31:
			A2=C;b2=a;a2=c;break;
		case 32:
			A2=C;b2=b;a2=c;break;
		}
h=b2*sin(A2*radconv);
if(A2<90){
	if(a2<h&&h<b2) ret=3;
	else if(a2>=b2)	ret=1;
	else if(a2==h) ret=1;
	else if(h<a2&&a2<b2) ret=2;
		}
else if(A2>90){
	if(b2>a2) ret=3;
	else ret=1;
		}
return(ret);
}

int drawratio(double in1,double in2,double in3){
int width=scrx(3), height=maxy-(scry(7)+scry(1)/2), starty=scry(7)+scry(1)/2;
int widthten=(width+1)/10, heightten=(height+1)/10,a2,b2,c2;
double a,b,c;
a=in1;b=in2;c=in3;
	if(a>=b&&a>=c)
		{a2=84;b2=(a2*b)/a;c2=(a2*c)/a;}
	else if(b>=a&&b>=c)
		{b2=84;a2=(b2*a)/b;c2=(b2*c)/b;}
	else
		{c2=84;a2=(c2*a)/c;b2=(c2*b)/c;}
setfillstyle(SOLID_FILL, getmaxcolor());
	bar(widthten,starty+heightten+84-a2,widthten*3,starty+heightten*8);
	bar(widthten*4,starty+heightten+84-b2,widthten*6,starty+heightten*8);
	bar(widthten*7,starty+heightten+84-c2,widthten*9,starty+heightten*8);
	line(widthten,starty+heightten*8,widthten*9,starty+heightten*8);
	text(widthten*2-5,starty+heightten*8+5,"a",6);
	text(widthten*5-5,starty+heightten*8+5,"b",6);
	text(widthten*8-5,starty+heightten*8+5,"c",6);
return 0;
}

int obliquechoice(char a, char b){
char *fchoice="[x][x]",*schoice="[x]", fres[100];
int i,l=1;

setcolor(14);
text(0,scry(3)+scry(1)/2+5,"Valid Choices:",6);
setcolor(15);
if(a!=''&&b==''){
	switch(a){
		case 'a': case 'b': case 'c':
			for(i=1;i<3;i++){
				if(a==(l+96)) l++;
				fchoice[-1+i*3-1]=l+96;l++;
				}
			sprintf(fres,"Side: %s",fchoice);
			text(20,scry(4)+10,fres,5);
			text(20,scry(4)+scry(1)/2+10,"Angle: [A][B][C]",5);
			break;
		case 'A': case 'B': case 'C':
			text(20,scry(4)+10,"Side: [a][b][c]",5);
			for(i=1;i<3;i++){
				if(a==(l+64)) l++;
				fchoice[-1+i*3-1]=l+64;l++;
				}
			sprintf(fres,"Angle: %s",fchoice);
			text(20,scry(4)+scry(1)/2+10,fres,5);
			}
	}
else if(a!=''&&b!=''){
	if((a=='a'||a=='b'||a=='c')&&(b=='A'||b=='B'||b=='C')){
			for(i=1;i<3;i++){
				if(a==(l+96)) l++;
				fchoice[-1+i*3-1]=l+96;l++;
				}
			l=1;
			sprintf(fres,"Side: %s",fchoice);
			text(20,scry(4)+10,fres,5);
			for(i=1;i<3;i++){
				if(b==(l+64)) l++;
				fchoice[-1+i*3-1]=l+64;l++;
				}
			sprintf(fres,"Angle: %s",fchoice);
			text(20,scry(4)+scry(1)/2+10,fres,5);
		}
	else if((a=='A'||a=='B'||a=='C')&&(b=='a'||b=='b'||b=='c')){
			for(i=1;i<3;i++){
				if(b==(l+96)) l++;
				fchoice[-1+i*3-1]=l+96;l++;
				}
			l=1;
			sprintf(fres,"Side: %s",fchoice);
			text(20,scry(4)+10,fres,5);
			for(i=1;i<3;i++){
				if(a==(l+64)) l++;
				fchoice[-1+i*3-1]=l+64;l++;
				}
			sprintf(fres,"Angle: %s",fchoice);
			text(20,scry(4)+scry(1)/2+10,fres,5);
		}
	else if((a=='A'||a=='B'||a=='C')&&(b=='A'||b=='B'||b=='C')){
		text(20,scry(4)+10,"Side: [a][b][c]",5);
		}
	else{
		schoice[1]=((a=='a'||a=='b')&&(b=='a'||b=='b')) ? 'c' :
			(((a=='a'||a=='c')&&(b=='a'||b=='c')) ? 'b' : 'a');
		sprintf(fres,"Side: %s",schoice);
		text(20,scry(4)+10,fres,5);
		text(20,scry(4)+scry(1)/2+10,"Angle: [A][B][C]",5);
		}
	}
else if(a==''&&b==''){
		text(20,scry(4)+10,"Side: [a][b][c]",5);
		text(20,scry(4)+scry(1)/2+10,"Angle: [A][B][C]",5);
	}
else{
		text(20,scry(4)+10,"Selection complete.",5);
	}
return 0;
}

void tsound(void){
	sound(500);
	delay(100);
	nosound();
}

void fsound(void){
	sound(1500);
	delay(100);
	nosound();
}
