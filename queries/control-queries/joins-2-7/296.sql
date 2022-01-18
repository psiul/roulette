select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 34 and ss.ss_hash <= 534 and i.i_hash >= 440 and i.i_hash <= 640
;
