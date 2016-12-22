const fi='';
      fo='';
var f,g:text;
    n,res:integer;
    a,h:array[0..30000] of longint;
procedure Doc;
var i:integer;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
procedure XuLi;
var i,dau,cuoi,giua:integer;
begin
        h[1]:=1;
        res:=1;
        for i:=2 to n do
        begin
                if a[i]>a[h[res]] then
                begin
                        inc(res);
                        h[res]:=i;
                end
                else
                begin
                        dau:=1;
                        cuoi:=res;
                        while dau<cuoi do
                        begin
                                giua:=(dau+cuoi) div 2;
                                if a[h[giua]]<a[i] then dau:=giua+1 else cuoi:=giua;
                        end;
                        h[dau]:=i;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,res);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
