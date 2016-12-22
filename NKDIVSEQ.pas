const fi='';
      fo='';
var f,g:text;
    n:longint;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        close(f);
end;
procedure XuLi;
var i,j,x,kq,kq1,k:longint;
begin
        x:=0;
        kq:=0;
        kq1:=0;
        for i:=1 to 1000000 do
        begin
                k:=1;
                while i*k<=kq1 do inc(k);
                for j:=1 to i do
                begin
                        kq:=i*k;
                        inc(k);
                        inc(x);
                        if x=n then
                        begin
                                assign(g,fo);
                                rewrite(g);
                                write(g,kq);
                                close(g);
                                halt;
                        end;
                        if j=i then
                        begin
                                kq1:=kq;
                                break;
                        end;
                end;
        end;
end;
begin
        Doc;
        XuLi;
end.
