select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 109 and ss.ss_hash <= 309 and i.i_hash >= 409 and i.i_hash <= 909
;
