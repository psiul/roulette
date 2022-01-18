select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 318 and ss.ss_hash <= 818 and i.i_hash >= 39 and i.i_hash <= 239
;
