select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 0 and ss.ss_hash <= 500 and i.i_hash >= 302 and i.i_hash <= 502
;
