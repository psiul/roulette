select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 373 and ss.ss_hash <= 573 and i.i_hash >= 449 and i.i_hash <= 949
;
