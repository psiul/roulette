select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 35 and ss.ss_hash <= 235 and i.i_hash >= 449 and i.i_hash <= 949
;
