select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 302 and ss.ss_hash <= 802 and i.i_hash >= 312 and i.i_hash <= 512
;
