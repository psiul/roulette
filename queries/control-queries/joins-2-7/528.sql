select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 430 and ss.ss_hash <= 630 and i.i_hash >= 170 and i.i_hash <= 670
;
