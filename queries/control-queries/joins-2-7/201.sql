select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 546 and ss.ss_hash <= 746 and i.i_hash >= 291 and i.i_hash <= 791
;
