const fi='';
      fo='';
var f,g:text;
    a:array[10..30000] of longint;
    l,r:longint;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,l,r);
        close(f);
end;
function UCLN(x,y:longint):boolean;
var r:longint;
begin
        while y>0 do
        begin
                r:=x mod y;
                x:=y;
                y:=r;
        end;
        if x=1 then exit(true) else exit(false);
end;
function DaoNguoc(i:longint):longint;
var xs,xs1:string;
    j:longint;
begin
        str(i,xs);
        xs1:='';
        for j:=length(xs) downto 1 do xs1:=xs1+xs[j];
        val(xs1,DaoNguoc);
end;
procedure XuLi;
var i,kq:longint;
begin
        kq:=0;
        for i:=l to r do
        begin
                if UCLN(i,DaoNguoc(i)) then inc(kq);
        end;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.