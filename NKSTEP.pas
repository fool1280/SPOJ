const fi='';
      fo='';
var f,g:text;
    x,y,t:longint;
procedure Doc;
var i,kq,k,temp:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,t);
        assign(g,fo);
        rewrite(g);
        for i:=1 to t do
        begin
                read(f,x,y);
                if x>y then
                begin
                        temp:=x;
                        x:=y;
                        y:=temp;
                end;
                k:=0;
                kq:=0;
                while x<y do
                begin
                        inc(k);
                        x:=x+k;
                        inc(kq);
                        if x<y then
                        begin
                                y:=y-k;
                                inc(kq);
                        end;
                end;
                writeln(g,kq);
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.


