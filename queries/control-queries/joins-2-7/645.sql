select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 445 and ss.ss_hash <= 645 and i.i_hash >= 273 and i.i_hash <= 773
;
