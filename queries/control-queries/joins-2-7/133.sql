select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 147 and ss.ss_hash <= 647 and i.i_hash >= 48 and i.i_hash <= 248
;
