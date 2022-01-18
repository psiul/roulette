select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 425 and ss.ss_hash <= 625 and i.i_hash >= 354 and i.i_hash <= 854
;
