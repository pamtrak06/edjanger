#/bin/bash
echo "compare web1 vs web2 production.properties..."
diff web1/production.properties web2/production.properties
echo "compare web1 vs web2 integration.properties..."
diff web1/integration.properties web2/integration.properties
echo "compare web1 vs web2 edocker.template..."
diff web1/edocker.template web2/edocker.template
echo "compare web1 vs web2 edocker.properties..."
diff web1/edocker.properties web2/edocker.properties
