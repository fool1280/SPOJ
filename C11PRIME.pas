uses math;
const fi='';
      fo='';
var f,g:text;
    n:extended;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        close(f);
end;
function tinhcan(i:longint):int64;
begin
        tinhcan:=round(exp(ln(n)/i));
end;
function KiemTra(x:int64;i:longint):extended;
var j:longint;
begin
        KiemTra:=1;
        for j:=1 to i do KiemTra:=(KiemTra)*x;
end;
function Snt(x:int64):boolean;
var i:longint;
begin
        for i:=2 to trunc(sqrt(x)) do if x mod i=0 then exit(false);
        exit(true);
end;
procedure XuLi;
var i:longint;
    x:int64;
begin
        for i:=1 to 63 do
        begin
                x:=tinhcan(i);
                if (KiemTra(x,i)=n) and (Snt(x)) then
                begin
                        assign(g,fo);
                        rewrite(g);
                        write(g,x,#32,i);
                        close(g);
                        halt;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,0);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
