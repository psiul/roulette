select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 405 and ss.ss_hash <= 605 and i.i_hash >= 456 and i.i_hash <= 956
;
