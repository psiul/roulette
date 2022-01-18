select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 460 and ss.ss_hash <= 960 and i.i_hash >= 133 and i.i_hash <= 333
;
