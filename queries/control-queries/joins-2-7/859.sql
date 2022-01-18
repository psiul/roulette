select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 222 and ss.ss_hash <= 422 and i.i_hash >= 52 and i.i_hash <= 552
;
