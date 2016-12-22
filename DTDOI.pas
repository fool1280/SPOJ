const fi='';
      fo='';
var n,s:longint;
    a:array[1..100] of longint;
    min:array[0..1000000] of longint;
    f,g:text;
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
procedure Doc;
var i,kq,j,l:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,s);
        for i:=1 to n do read(f,a[i]);
        Sort(1,n);
        kq:=0;
        while s>trunc(1e6) do
        begin
                s:=s-a[n];
                inc(kq);
        end;
        min[0]:=kq;
        for i:=1 to s do
        begin
                l:=maxlongint;
                for j:=1 to n do
                begin
                        if (a[j]<=i) and (min[i-a[j]]<l) then l:=min[i-a[j]];
                end;
                min[i]:=l+1;
        end;
        close(f);
        assign(g,fo);
        rewrite(g);
        write(g,min[s]);
        close(g);
end;
begin
        Doc;
end.