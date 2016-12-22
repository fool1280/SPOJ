const fi='NKMAXSEQ.INP';
      fo='NKMAXSEQ.OUT';
var f,g:text;
    a:array[0..50000] of longint;
    d:array[0..50000] of boolean;
    n,p:longint;
procedure Doc;
var i,c,min:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,p);
        min:=0;
        a[0]:=0;
        d[0]:=true;
        for i:=1 to n do
        begin
                read(f,c);
                a[i]:=a[i-1]+c;
                if a[i]<min then
                begin
                        min:=a[i];
                        d[i]:=true;
                end;
        end;
        close(f);
end;
procedure XuLi;
var max,pos,i,j:longint;
begin
        max:=-1;
        pos:=n;
        for i:=n downto 0 do
        begin
                if d[i] then
                begin
                        for j:=pos downto i+1 do
                        begin
                                if a[j]-a[i]>=p then
                                begin
                                        if j-i>max then max:=j-i;
                                        break;
                                end;
                        end;
                        pos:=j;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.

