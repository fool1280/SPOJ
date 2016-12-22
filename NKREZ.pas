const fi='';
      fo='';
var f,g:text;
    a,b,t:array[1..10000] of longint;
    n:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do
        begin
                read(f,a[i],b[i]);
        end;
        close(f);
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=b[random(r-l+1)+l];
        repeat
                while b[i]<k do inc(i);
                while b[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=b[i];
                        b[i]:=b[j];
                        b[j]:=temp;
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if l<j then Sort(l,j);
        if i<r then Sort(i,r);
end;
procedure XuLi;
var i,j,max,temp:longint;
begin
        Sort(1,n);
        max:=1;
        for i:=1 to n do
        begin
                temp:=0;
                for j:=i-1 downto 1 do
                begin
                        if (b[j]<=a[i]) and (t[j]>temp) then
                        begin
                                temp:=t[j];
                        end;
                end;
                t[i]:=b[i]-a[i]+temp;
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