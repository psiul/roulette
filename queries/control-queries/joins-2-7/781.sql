select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 433 and ss.ss_hash <= 933 and i.i_hash >= 419 and i.i_hash <= 619
;
