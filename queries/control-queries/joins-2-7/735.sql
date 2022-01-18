select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 244 and ss.ss_hash <= 444 and i.i_hash >= 348 and i.i_hash <= 848
;
