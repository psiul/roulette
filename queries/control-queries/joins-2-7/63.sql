select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 257 and ss.ss_hash <= 757 and i.i_hash >= 182 and i.i_hash <= 382
;
