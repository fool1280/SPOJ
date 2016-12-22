const fi='';
      fo='';
var f,g:text;
    n,m:longint;
    a:array[1..10000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
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
        if l<j then Sort(l,j);
        if i<r then Sort(i,r);
end;
function tknp(x:longint):longint;
var l,r,mid:longint;
begin
        l:=1;
        r:=n;
        repeat
                mid:=(l+r+1) div 2;
                if a[mid]=x then exit(mid);
                if a[mid]>x then r:=mid-1 else l:=mid;
        until l=r;
        if a[l]<=x then exit(l) else exit(0);
end;
procedure XuLi;
var i,j,k,t,res:longint;
begin
        res:=0;
        for i:=1 to n-1 do
        for j:=i+1 to n do
        begin
                t:=m-a[i]-a[j];
                k:=tknp(t);
                if (k>0) and (k<>i) and (k<>j) and (a[i]+a[j]+a[k]>res) then res:=a[i]+a[j]+a[k];
        end;
        assign(g,fo);
        rewrite(g);
        write(g,res);
        close(g);
end;
begin
        Doc;
        Sort(1,n);
        XuLi;
end.
