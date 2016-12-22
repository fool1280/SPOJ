const fi='';
      fo='';
var f,g:text;
    a,t:array[0..10000] of longint;
    n,k:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,k);
        for i:=1 to n do read(f,a[i]);
        fillchar(t,sizeof(t),0);
        close(f);
end;
procedure XuLi;
var i,j,max,temp:longint;
begin
        max:=0;
        t[0]:=0;
        for i:=1 to n do
        begin
                temp:=-maxlongint;
                for j:=i-1 downto i-k do
                begin
                        if (j>=0) and (t[j]>temp) then temp:=t[j];
                end;
                t[i]:=a[i]+temp;
                if t[i]>max then max:=t[i];
        end;
        assign(g,fo);
        rewrite(g);
        write(g,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.