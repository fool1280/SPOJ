const fi='';
      fo='';
var f,g:text;
    n,k,front,back:longint;
    queue:array[1..1000000] of longint;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,n,k);
        close(f);
end;
procedure XuLi;
var i,v,kq:longint;
begin
        front:=1;
        back:=1;
        queue[back]:=n;
        kq:=1;
        repeat
                v:=queue[front];
                inc(front);
                if ((v-k) mod 2=0) and (v>k) then
                begin
                        inc(back);
                        queue[back]:=(v-k) div 2;
                        inc(back);
                        queue[back]:=(v+k) div 2;
                        kq:=kq+1;
                end;
        until front>back;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
