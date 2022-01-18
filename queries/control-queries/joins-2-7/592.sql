select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 261 and ss.ss_hash <= 761 and i.i_hash >= 350 and i.i_hash <= 550
;
