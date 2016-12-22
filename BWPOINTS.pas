const fi='';
      fo='';
var f,g:text;
    n:longint;
    a,dd,pb:array[1..200000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do
        begin
                read(f,a[i]);
                pb[i]:=1;
                dd[i]:=0;
        end;
        for i:=n+1 to n*2 do
        begin
                read(f,a[i]);
                pb[i]:=0;
                dd[i]:=0;
        end;
        n:=n*2;
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
                        temp:=pb[i];
                        pb[i]:=pb[j];
                        pb[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure XuLi;
var i,k:longint;
begin
        k:=0;
        for i:=2 to n do
        begin
                if (dd[i]=0) and (dd[i-1]=0) then
                begin
                        if (pb[i]<>pb[i-1]) then
                        begin
                                inc(k);
                                dd[i]:=1;
                                dd[i-1]:=1;
                        end;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,k);
        close(g);
end;
begin
        Doc;
        Sort(1,n);
        XuLi;
end.
