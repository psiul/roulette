select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 78 and ss.ss_hash <= 278 and i.i_hash >= 227 and i.i_hash <= 727
;
