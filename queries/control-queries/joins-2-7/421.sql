select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 429 and ss.ss_hash <= 629 and i.i_hash >= 68 and i.i_hash <= 568
;
