select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 477 and ss.ss_hash <= 977 and i.i_hash >= 174 and i.i_hash <= 374
;
