select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 498 and ss.ss_hash <= 998 and i.i_hash >= 93 and i.i_hash <= 293
;
