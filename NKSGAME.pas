const fi='';
      fo='';
var f,g:text;
    n,kq,min:longint;
    b,c:array[1..100000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do read(f,b[i]);
        for i:=1 to n do read(f,c[i]);
        close(f);
end;
procedure Ghi;
begin
        assign(g,fo);
        rewrite(g);
        write(g,min);
        close(g);
end;
procedure TKNP(i:longint);
var dau,giua,cuoi,k:longint;
begin
        dau:=1;
        cuoi:=n;
        while abs(cuoi-dau)<>1 do
        begin
                giua:=(dau+cuoi) div 2;
                if c[giua]=i then
                begin
                        kq:=abs(c[giua]+(i*(-1)));
                        exit;
                end;
                if i<c[giua] then cuoi:=giua else dau:=giua;
        end;
        if abs(i-c[dau])<abs(i-c[cuoi]) then
        begin
                kq:=abs(c[dau]+(i*(-1)));
                exit;
        end
        else
        begin
                kq:=abs(c[cuoi]+(i*(-1)));
                exit;
        end;
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=c[random(r-l+1)+l];
        repeat
                while c[i]<k do inc(i);
                while c[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=c[i];
                        c[i]:=c[j];
                        c[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure XuLi;
var i,j:longint;
begin
        min:=maxlongint;
        Sort(1,n);
        for i:=1 to n do
        begin
                TKNP(b[i]*(-1));
                if kq<min then min:=kq;
                if min=0 then break;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,min);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
