select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 317 and ss.ss_hash <= 517 and i.i_hash >= 94 and i.i_hash <= 594
;
