select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 379 and ss.ss_hash <= 879 and i.i_hash >= 138 and i.i_hash <= 338
;
