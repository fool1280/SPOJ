const fi='';
      fo='';
      maxn=10000000;
var f,g:text;
    kt:array[2..maxn] of boolean;
    m,t,k:longint;
    n:qword;
    nn:string;
    luu:array[1..1000000] of longint;
procedure Init;
var i,j:longint;
begin
        for i:=2 to maxn do kt[i]:=true;
        m:=0;
        for i:=2 to maxn do
        begin
                if kt[i]=true then
                begin
                        inc(m);
                        luu[m]:=i;
                        for j:=i to (maxn div i) do kt[j*i]:=false;
                end;
        end;
end;
function mul(a:string;b:longint):string;
var c,tmp:string;
    i,hold,s:longint;
begin
        hold:=0;
        c:='';
        for i:=length(a) downto 1 do
        begin
                s:=b*(ord(a[i])-48)+hold;
                c:=chr(s mod 10 + 48)+c;
                hold:=s div 10;
        end;
        if hold>0 then str(hold,tmp) else tmp:='';
        exit(tmp+c);
end;
function cmp(a,b:string):longint;
begin
        while length(a)<length(b)do a:='0'+a;
        while length(a)>length(b)do b:='0'+b;
        if a<=b then exit(0)
        else
        if a>b then exit(1);
end;
function check(x:longint):boolean;
var a,b:string;
    i:longint;
begin
        a:='1';
        for i:=1 to k do a:=mul(a,luu[x-i+1]);
        if cmp(a,nn)<>1 then exit(true);
        exit(false);
end;
function TKNP(n,k:qword):qword;
var l,r,mid,i:longint;
    kq,d:qword;
begin
        kq:=0;
        l:=k;
        r:=m;
        while l<=r do
        begin
                mid:=(l+r) div 2;
                if check(mid) then
                begin
                        kq:=mid;
                        l:=mid+1;
                end
                else r:=mid-1;
        end;
        exit(kq);
end;
procedure Doc;
var i,j:longint;
    l,d:qword;
begin
        assign(f,fi);
        reset(f);
        read(f,t);
        assign(g,fo);
        rewrite(g);
        for i:=1 to t do
        begin
                readln(f,n,k);
                str(n,nn);
                l:=TKNP(n,k);
                if l=0 then writeln(g,-1)
                else
                begin
                        d:=1;
                        for j:=l downto l-k+1 do d:=d*luu[j];
                        writeln(g,d);
                end;
        end;
        close(g);
        close(f);
end;
begin
        Init;
        Doc;
end.
