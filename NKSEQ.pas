const fi='';
      fo='';
var f,g:text;
    a,l,r,s:array[0..100001] of longint;
    n,t:longint;
function min(a,b:longint):longint;
begin
        if a<b then exit(a) else exit(b);
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        l[0]:=maxlongint;
        t:=0;
        for i:=1 to n do
        begin
                t:=t+a[i];
                l[i]:=min(l[i-1],t);
        end;
        r[n]:=a[n];
        s[n]:=a[n];
        for i:=n-1 downto 1 do
        begin
                r[i]:=min(r[i+1]+a[i],a[i]);
                s[i]:=s[i+1]+a[i];
        end;
        close(f);
end;
procedure XuLi;
var kq,i:longint;
begin
        kq:=0;
        if t>0 then
        begin
                if r[1]>0 then kq:=1;
                for i:=1 to n do
                begin
                        if (r[i]>0) and (s[i]+l[i-1]>0) then inc(kq);
                end;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.