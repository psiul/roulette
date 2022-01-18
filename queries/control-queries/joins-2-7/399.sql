select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 297 and ss.ss_hash <= 797 and i.i_hash >= 647 and i.i_hash <= 847
;
