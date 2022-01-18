select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 486 and ss.ss_hash <= 986 and i.i_hash >= 618 and i.i_hash <= 818
;
