select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 105 and ss.ss_hash <= 305 and i.i_hash >= 71 and i.i_hash <= 571
;
