const fi='';
      fo='';
var n,k,kq:int64;
    f,g:text;
    a:array[1..1000000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,k);
        k:=n-k-1;
        for i:=1 to n do read(f,a[i]);
        kq:=a[1];
        a[1]:=0;
        close(f);
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=a[random(r-l+1)+l];
        repeat
                while a[i]<k do inc(i);
                while a[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure XuLi;
var i:longint;
begin
        for i:=2 to n do
        begin
                if k>0 then
                begin
                        kq:=kq-a[i];
                        dec(k);
                end else kq:=kq+a[i];
        end;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        Sort(2,n);
        XuLi;
end.