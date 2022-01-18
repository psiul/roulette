select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 247 and ss.ss_hash <= 447 and i.i_hash >= 284 and i.i_hash <= 784
;
