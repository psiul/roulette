select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 203 and ss.ss_hash <= 703 and i.i_hash >= 8 and i.i_hash <= 208
;
