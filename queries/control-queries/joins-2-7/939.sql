select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 532 and ss.ss_hash <= 732 and i.i_hash >= 89 and i.i_hash <= 589
;
